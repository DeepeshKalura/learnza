class RawSQLQueryUtils {
  static const String createBooksSQLQuery = """
CREATE TABLE books (
  id TEXT PRIMARY KEY, 
  isbn TEXT,
  bookTitle TEXT,
  description TEXT,
  code TEXT,
  bookUrl TEXT,
  thumbnail TEXT,
  language TEXT NOT NULL,
  author TEXT, -- Stored as a comma-separated string (if using List<String>)
  categories TEXT NOT NULL, -- Stored as a comma-separated string
  publisher TEXT,
  isActive INTEGER NOT NULL, -- Use 0 or 1 to represent boolean
  createdAt TEXT NOT NULL, -- ISO 8601 formatted datetime string
  updatedAt TEXT, -- Nullable datetime
  publishedAt TEXT, -- Nullable datetime
  founded INTEGER NOT NULL, -- Use 0 or 1 to represent boolean
  editor TEXT,
  moreImageUrl TEXT NOT NULL -- Stored as a comma-separated string
);
""";

  static const String createBooksPositionSqlQuery = """

CREATE TABLE bookposition (

  fileName TEXT PRIMARY KEY, 
  position TEXT NOT NULL
);

""";

  static const String createUserPreferenceSqlQuery = """

CREATE TABLE userpreference (
 
  darkMode INTEGER DEFAULT 0,
  language TEXT DEFAULT 'en'
);

""";
}
