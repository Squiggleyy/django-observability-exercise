#git clone https://github.com/open-telemetry/opentelemetry-python.git
#cd opentelemetry-python/docs/examples/django
python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade pip
pip3 install django opentelemetry-sdk opentelemetry-instrumentation-django requests
export DJANGO_SETTINGS_MODULE=instrumentation_example.settings

pip3 install opentelemetry-exporter-otlp
export OTEL_SERVICE_NAME=django-demo
export OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="https://152463139077.collect.observeinc.com/v2/otel"
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer ds1rwxLxx1lp7V2Lsz6J:pKCyXwi0gv5njdTKcEw7W3_y7SObAxpP,x-observe-target-package=\"Tracing\""
export OTEL_LOG_LEVEL=debug

#python3 manage.py migrate

echo "env variables 1"
echo $OTEL_EXPORTER_OTLP_PROTOCOL
echo $OTEL_EXPORTER_OTLP_TRACES_ENDPOINT
echo $OTEL_EXPORTER_OTLP_HEADERS
echo $OTEL_SERVICE_NAME

python3 manage.py runserver --noreload

# echo "env variables 2"
# echo $OTEL_EXPORTER_OTLP_PROTOCOL
# echo $OTEL_EXPORTER_OTLP_TRACES_ENDPOINT
# echo $OTEL_EXPORTER_OTLP_HEADERS
# echo $OTEL_SERVICE_NAME