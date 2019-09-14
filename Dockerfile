FROM python:3.7

ENV NAME igctf
ENV APP_HOME /igctf

RUN groupadd -r ${NAME} && useradd -r -g ${NAME} ${NAME}

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

USER igctf

WORKDIR ${APP_HOME}

COPY --chown=igctf:igctf nullctf.py util.py ${APP_HOME}/
COPY --chown=igctf:igctf cogs ${APP_HOME}/cogs
COPY --chown=igctf:igctf vars ${APP_HOME}/vars
COPY --chown=igctf:igctf models ${APP_HOME}/models
COPY --chown=igctf:igctf controllers ${APP_HOME}/controllers

CMD ["python", "-u", "nullctf.py"]