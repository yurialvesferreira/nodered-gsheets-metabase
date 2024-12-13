FROM eclipse-temurin:11

COPY --from=metabase/metabase:v0.50.20 /app /app

RUN useradd -ms /bin/sh metabase && chown -R metabase /app
WORKDIR /app
USER metabase

ENTRYPOINT ["/app/run_metabase.sh"]
# https://github.com/metabase/metabase/issues/13119#issuecomment-1502042436