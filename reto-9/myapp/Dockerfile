FROM python:3
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN apt-get -y update
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python3","./myapp.py"]