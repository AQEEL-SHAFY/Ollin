FROM python:3.10
ENV PYTHONUNBUFFERED 1
ENV PORT 8080
EXPOSE 8080
WORKDIR /app
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
ENTRYPOINT ["python","app.py"]
