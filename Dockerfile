from python:3

WORKDIR /usr/src/app
RUN pip install --no-cache-dir blackduck

COPY . .

CMD [ "sh", "-c", "python3 ./snippets-ignore.py ${base_url} token.txt ${project_name} ${project_version}" ]