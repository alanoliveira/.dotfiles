FROM python:3-slim-bookworm

WORKDIR /root

RUN apt-get update && apt-get install -y libgl1 libglib2.0-0 libgomp1 python3-setuptools curl

RUN python -m pip install paddlepaddle-gpu==3.1.0 -i https://www.paddlepaddle.org.cn/packages/stable/cu118/

RUN pip install paddleocr setuptools flask

ADD ./server.py ./

CMD [ "server.py" ]
