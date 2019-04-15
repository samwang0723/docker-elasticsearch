FROM elasticsearch:6.5.4
ENV ES_IK_VERSION 6.5.4

ADD --chown=elasticsearch:elasticsearch config/elasticsearch.yml /usr/share/elasticsearch/config/

RUN bin/elasticsearch-plugin install analysis-kuromoji
RUN bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ES_IK_VERSION}/elasticsearch-analysis-ik-${ES_IK_VERSION}.zip

COPY config/ik/. /usr/share/elasticsearch/config/analysis-ik/

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config/analysis-ik