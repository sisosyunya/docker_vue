FROM node:14.18.1
WORKDIR /src
COPY package*.json ./
RUN yarn global add @vue/cli
# カレントワーキングディレクトリ(つまり 'app' フォルダ)にプロジェクトのファイルやフォルダをコピーする
COPY . .
# 本番向けに圧縮しながらアプリケーションをビルドする
RUN yarn build

EXPOSE 8080
CMD [ "http-server", "dist" ]