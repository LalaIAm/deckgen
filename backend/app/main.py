from fastapi import FastAPI


app = FastAPI(title="deckgen-backend")


@app.get("/health")
async def health() -> dict:
    return {"status": "ok"}
