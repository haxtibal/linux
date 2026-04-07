from strictdoc.core.project_config import ProjectConfig


def create_config() -> ProjectConfig:
    config = ProjectConfig(
        project_title="Linux Kernel StrictDoc",
        project_features=[
            "REQUIREMENT_TO_SOURCE_TRACEABILITY",
            "SOURCE_FILE_LANGUAGE_PARSERS",
        ],
        source_root_path="linux",
        exclude_doc_paths=[
            "linux/**"
        ],
        include_source_paths=[
            "drivers/mailbox/**.c",
            "kernel/irq/**.c",
        ],
    )
    return config
