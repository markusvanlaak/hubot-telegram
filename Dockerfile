FROM alpine:3.3
RUN apk update && apk add bash sudo && apk add nodejs
RUN addgroup -g 501 -S bot && adduser -S -G bot -u 501 -s /bin/bash -h /home/bot bot

RUN npm install -g npm
RUN npm install -g yo generator-hubot
RUN npm install --save hubot-telegram

RUN mkdir -p /root/.config/configstore 
RUN chmod g+rwx /root /root/.config /root/.config/configstore

USER bot
ENV TELEGRAM_TOKEN <your token>
#RUN ls && pwd
RUN cd /home/bot && echo No| yo hubot --name="Markusvanlaakbot" --adapter=campfire --owner="markusvanlaak@gmail.com" --defaults
RUN cd /home/bot && npm install --save hubot-telegram
CMD cd /home/bot && bin/hubot -a telegram
