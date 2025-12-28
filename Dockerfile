FROM alpine:latest

# نصب وابستگی‌ها
RUN apk add --no-cache curl unzip

# دانلود Xray از ریپوی رسمی
RUN curl -L https://github.com/XTLS/Xray-core/releases/download/v1.8.11/Xray-linux-64.zip -o xray.zip \
    && unzip xray.zip \
    && chmod +x xray \
    && mv xray /usr/local/bin/ \
    && rm xray.zip geoip.dat geosite.dat

# کپی کانفیگ
COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["xray", "run", "-config=/etc/xray/config.json"]
