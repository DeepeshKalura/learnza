import sys
import uuid
from datetime import datetime, timedelta
from typing import List, Optional, Dict, Any

import firebase_admin
from firebase_admin import credentials, firestore, storage
from PyQt5.QtWidgets import (QApplication, QWidget, QVBoxLayout, QHBoxLayout, 
                             QLabel, QLineEdit, QTextEdit, QComboBox, 
                             QPushButton, QFileDialog, QMessageBox, QScrollArea)
from PyQt5.QtCore import Qt
from pydantic import BaseModel, Field, validator

# Firebase Initialization
cred = credentials.Certificate('serviceAccountKey.json')
firebase_admin.initialize_app(cred, {
    'storageBucket': 'learnza.firebasestorage.app'
})
db = firestore.client()
storage_bucket = storage.bucket()

class BooksModel(BaseModel):
    # Core Identification
    id: str = Field(default_factory=lambda: str(uuid.uuid4()))
    book_title: str
    isbn: Optional[str] = None
    
    # Metadata
    author: List[str] = Field(default_factory=list)
    publisher: Optional[str] = None
    description: Optional[str] = None
    edition: Optional[str] = None
    language: str = 'en'
    
    # Academic Details
    course_id: Optional[str] = None
    academic_year: Optional[int] = 1
    subject_code: Optional[str] = None
    
    # File Management
    book_url: Optional[str] = None
    thumbnail: Optional[str] = None
    more_image_urls: List[str] = Field(default_factory=list)
    
    # Classification
    categories: List[str] = Field(default_factory=list)
    tags: List[str] = Field(default_factory=list)
    
    # Status and Lifecycle
    is_active: bool = True
    is_published: bool = True
    is_free: bool = True
    
    # Timestamps
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: Optional[datetime] = None
    published_at: Optional[datetime] = None
    
    # Extended Metadata
    code: Optional[str] = None
    format: str = 'pdf'
    editor: Optional[str] = None
    
    # Additional Metadata
    additional_info: Dict[str, Any] = Field(default_factory=dict)
    
    @validator('author', pre=True, always=True)
    def convert_to_list(cls, v):
        return [v] if isinstance(v, str) else v or []

    class Config:
        arbitrary_types_allowed = True
        json_encoders = {
            datetime: lambda v: v.isoformat()
        }

class BookUploadApp(QWidget):
    COURSES = {
        'Bachelor of Business Studies': 'b112a345-0c7d-404d-8e0a-238a75b04c8c',
        'Bachelor of Education': 'f85c24ab-dac6-4f5e-b61e-b3910163ebbd'
    }

    def __init__(self):
        super().__init__()
        self.pdf_path = None
        self.thumbnail_path = None
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Advanced Book Upload Application')
        self.setGeometry(100, 100, 700, 900)

        main_layout = QVBoxLayout()
        
        # Scroll Area for Inputs
        scroll_area = QScrollArea()
        scroll_content = QWidget()
        layout = QVBoxLayout(scroll_content)

        # Course Selection
        course_layout = QHBoxLayout()
        course_label = QLabel('Select Course:')
        self.course_combo = QComboBox()
        self.course_combo.addItems(list(self.COURSES.keys()))
        course_layout.addWidget(course_label)
        course_layout.addWidget(self.course_combo)
        layout.addLayout(course_layout)

        # Academic Year Selection
        year_layout = QHBoxLayout()
        year_label = QLabel('Academic Year:')
        self.year_combo = QComboBox()
        self.year_combo.addItems(['1', '2', '3', '4'])  
        year_layout.addWidget(year_label)
        year_layout.addWidget(self.year_combo)
        layout.addLayout(year_layout)

        # Comprehensive Input Fields
        input_fields = [
            ('Book Title', 'book_title', True),
            ('ISBN', 'isbn', False),
            ('Author', 'author', False),
            ('Publisher', 'publisher', False),
            ('Edition', 'edition', False),
            ('Subject Code', 'subject_code', False),
            ('Categories', 'categories', False),
            ('Tags', 'tags', False),
            ('Description', 'description', False)
        ]

        for label_text, attr_name, is_required in input_fields:
            field_layout = QHBoxLayout()
            label = QLabel(f"{label_text}{'*' if is_required else ''}:")
            line_edit = QLineEdit()
            setattr(self, f'{attr_name}_input', line_edit)
            field_layout.addWidget(label)
            field_layout.addWidget(line_edit)
            layout.addLayout(field_layout)

        # PDF Upload Button
        pdf_layout = QHBoxLayout()
        self.pdf_path_label = QLabel('No PDF selected')
        pdf_upload_btn = QPushButton('Select PDF')
        pdf_upload_btn.clicked.connect(self.select_pdf)
        pdf_layout.addWidget(self.pdf_path_label)
        pdf_layout.addWidget(pdf_upload_btn)
        layout.addLayout(pdf_layout)

        # Thumbnail Upload Button
        thumbnail_layout = QHBoxLayout()
        self.thumbnail_path_label = QLabel('No Thumbnail selected')
        thumbnail_upload_btn = QPushButton('Select Thumbnail')
        thumbnail_upload_btn.clicked.connect(self.select_thumbnail)
        thumbnail_layout.addWidget(self.thumbnail_path_label)
        thumbnail_layout.addWidget(thumbnail_upload_btn)
        layout.addLayout(thumbnail_layout)

        # Buttons Layout
        btn_layout = QHBoxLayout()
        upload_btn = QPushButton('Upload Book')
        upload_btn.clicked.connect(self.upload_book)
        clear_btn = QPushButton('Clear All')
        clear_btn.clicked.connect(self.clear_all_inputs)
        btn_layout.addWidget(upload_btn)
        btn_layout.addWidget(clear_btn)
        layout.addLayout(btn_layout)

        scroll_content.setLayout(layout)
        scroll_area.setWidget(scroll_content)
        scroll_area.setWidgetResizable(True)
        
        main_layout.addWidget(scroll_area)
        self.setLayout(main_layout)

    def select_pdf(self):
        file_dialog = QFileDialog()
        self.pdf_path, _ = file_dialog.getOpenFileName(self, 'Select PDF', '', 'PDF Files (*.pdf)')
        if self.pdf_path:
            self.pdf_path_label.setText(self.pdf_path.split('/')[-1])

    def select_thumbnail(self):
        file_dialog = QFileDialog()
        self.thumbnail_path, _ = file_dialog.getOpenFileName(self, 'Select Thumbnail', '', 'Image Files (*.png *.jpg *.jpeg *.gif *.bmp)')
        if self.thumbnail_path:
            self.thumbnail_path_label.setText(self.thumbnail_path.split('/')[-1])

    def upload_book(self):
        try:
            # Validate inputs
            if not self.book_title_input.text():
                raise ValueError("Book Title is required")

            # Get course ID
            course_name = self.course_combo.currentText()
            course_id = self.COURSES[course_name]

            # Upload PDF to Firebase Storage
            book_url = None
            book_id = str(uuid.uuid4())
            if self.pdf_path:
                pdf_blob = storage_bucket.blob(f'books/{book_id}.pdf')
                pdf_blob.upload_from_filename(self.pdf_path )
                dowbload_url = pdf_blob.generate_signed_url(
                    expiration=datetime.utcnow() + timedelta(days=2000),  # Set expiry duration
                    method="GET",
                )
                book_url = dowbload_url

            # Upload Thumbnail to Firebase Storage
            thumbnail_url = None
            if self.thumbnail_path:
                thumbnail_blob = storage_bucket.blob(f'thumbnails/{book_id}.{self.thumbnail_path.split(".")[-1]}')
                thumbnail_blob.upload_from_filename(self.thumbnail_path)
                thumbnail_url = thumbnail_blob.public_url

            # Prepare book data
            book_data = BooksModel(
                book_title=self.book_title_input.text(),
                book_url=book_url,
                thumbnail=thumbnail_url,
                isbn=self.isbn_input.text(),
                author=[self.author_input.text()],
                publisher=self.publisher_input.text(),
                description=self.description_input.text(),
                course_id=course_id,
                academic_year=int(self.year_combo.currentText()),
                edition=self.edition_input.text(),
                subject_code=self.subject_code_input.text(),
                categories=self.categories_input.text().split(',') if self.categories_input.text() else [],
                tags=self.tags_input.text().split(',') if self.tags_input.text() else []
            )

            # Upload to Firestore
            books_ref = db.collection('books')
            books_ref.document(book_data.id).set(book_data.model_dump())

            QMessageBox.information(self, 'Success', 'Book uploaded successfully!')
            self.clear_all_inputs()

        except Exception as e:
            QMessageBox.critical(self, 'Error', f'Upload failed: {str(e)}')

    def clear_all_inputs(self):
        # Clear all input fields
        for attr in ['book_title', 'isbn', 'author', 'publisher', 'description', 
                     'edition', 'subject_code',  'categories', 'tags']:
            getattr(self, f'{attr}_input').clear()
        
        # Reset PDF selection
        self.pdf_path = None
        self.pdf_path_label.setText('No PDF selected')
        
        # Reset Thumbnail selection
        self.thumbnail_path = None
        self.thumbnail_path_label.setText('No Thumbnail selected')

def main():
    app = QApplication(sys.argv)
    ex = BookUploadApp()
    ex.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()