
def run(plan, args):
    plan.add_service(
        name="jaeger",
        config=ServiceConfig(
            image="jaegertracing/all-in-one:latest",
            ports = {
                "dashboard": PortSpec(16686, application_protocol = "http"),
            },
            public_ports = {
                "dashboard": PortSpec(16686, application_protocol = "http"),
            },
            env_vars = {
                "COLLECTOR_ZIPKIN_HOST_PORT": "9411",
                "COLLECTOR_OTLP_ENABLED": "true",
            },
        ),
        description="Jaeger",
    )