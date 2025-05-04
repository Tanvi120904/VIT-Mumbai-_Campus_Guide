from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base

# PostgreSQL Database URL
DATABASE_URL = "postgresql://root:newpassword@localhost:5432/navigation_db"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)
Base = declarative_base()

# Define the Table
class Location(Base):
    __tablename__ = "locations"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    direction = Column(String, nullable=False)
    image_url = Column(String, nullable=False)

# FastAPI App
app = FastAPI()

# Fetch Data
@app.get("/locations")
def get_locations():
    db = SessionLocal()
    locations = db.query(Location).all()
    db.close()
    return locations
