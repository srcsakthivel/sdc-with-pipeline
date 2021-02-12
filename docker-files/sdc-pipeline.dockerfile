ARG SDC_VERSION=3.2.0.0
FROM streamsets/datacollector:${SDC_VERSION}
ARG SDC_LIBS
COPY resources/ resources/
RUN "${SDC_DIST}/bin/streamsets" stagelibs -install="${SDC_LIBS}"
#COPY --chown=sdc:sdc sdc-extras/ ${STREAMSETS_LIBRARIES_EXTRA_DIR}/