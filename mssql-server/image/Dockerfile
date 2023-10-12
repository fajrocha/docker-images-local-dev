# Common build step in an initial stage
FROM mcr.microsoft.com/mssql/server:2022-latest as build

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Pwd12345!

WORKDIR /tmp
COPY bak/*.bak .
COPY scripts/*.sql .

EXPOSE 1433

RUN (/opt/mssql/bin/sqlservr --accept-eula &) | grep -q "Service Broker manager has started" \
    && for db in $(ls *.bak | sed 's/\.bak//g'); do \
           /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /tmp/restore$db.sql; \
       done \
    && pkill sqlservr

# Copy data from data to 
FROM mcr.microsoft.com/mssql/server:2022-latest as release
ENV ACCEPT_EULA=Y

COPY --from=build /var/opt/mssql /var/opt/mssql