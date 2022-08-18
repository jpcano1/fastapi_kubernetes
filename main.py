from fastapi import FastAPI

app = FastAPI(title="K8s Test")

@app.get("/")
async def hello_world():
    return {
        "Hello": "World",
    }
