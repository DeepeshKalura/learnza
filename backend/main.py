from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse

from app.router import authentication, books

app = FastAPI()

origins = ["http://127.0.0.0"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    # Log the details of the request and errors
    print(f"Request: {request.body}")
    print(f"Errors: {exc.errors()}")
    return JSONResponse(
        status_code=400,
        content={"detail": exc.errors(), "body": exc.body},
    )

app.include_router(authentication.router)
app.include_router(books.router)

@app.get("/")
def read_root():
    return {"Hello": "World"}

