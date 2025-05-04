from fastapi import FastAPI, HTTPException
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError

DATABASE_URL = "postgresql://root:newpassword@localhost:5432/navigation_db"

engine = create_engine(DATABASE_URL)

app = FastAPI()

@app.get("/check_db")
async def check_db():
    try:
        with engine.connect() as connection:
            connection.execute("SELECT 1")  # Simple test query
        return {"message": "Database is connected!"}
    except SQLAlchemyError:
        raise HTTPException(status_code=500, detail="Database connection failed.")
