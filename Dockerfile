FROM python:3.8-alpine
RUN echo "print('hello world')" > hello.py
ENTRYPOINT ["python"]
CMD ["./hello.py"]