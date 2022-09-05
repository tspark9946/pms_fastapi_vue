from api import app
from loguru import logger

stars = {
     "Bruce Willis": {"moivies": ["Die Hard", "Blind Date"]},
     "Arnold Whsarzenegger": {"movies": ["Terminator", "Conan", "Commando"]},
     "Sylverster Stallone": {"movies": ["Rambo", "Cobra", "Over the Top"]},
}


@app.get("/fetch")
async def fetch():
    """ returns 80s moivestars """

    logger.info("fetching movie stars")
    return stars
