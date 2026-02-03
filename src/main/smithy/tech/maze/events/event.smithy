$version: "2"

namespace tech.maze.events

use smithy.api#Document
use smithy.api#jsonName
use smithy.api#Timestamp

/// CloudEvents v1.0 envelope (https://cloudevents.io/).
structure CloudEvent {
    /// CloudEvents spec version (typically "1.0").
    @required
    specversion: String

    /// Unique event identifier.
    @required
    id: String

    /// Event source as a URI reference.
    @required
    source: String

    /// Event type (schema-defined).
    @required
    type: String

    /// Optional subject of the event in the context of the source.
    subject: String

    /// Time when the event occurred.
    time: Timestamp

    /// MIME type of the event payload.
    datacontenttype: String

    /// Schema describing the event payload.
    dataschema: String

    /// Structured event payload.
    data: Document

    /// Optional binary payload (base64 encoded).
    @jsonName("data_base64")
    dataBase64: Blob

    /// Optional extension attributes.
    extensions: CloudEventExtensions
}

map CloudEventExtensions {
    key: String
    value: Document
}

/// Marks a structure as an event payload and provides CloudEvents metadata.
@trait(selector: "structure")
structure event {
    /// CloudEvents `type` attribute for this event.
    @required
    type: String

    /// CloudEvents `source` attribute (URI reference) for this event.
    @required
    source: String

    /// Optional CloudEvents `subject` attribute.
    subject: String

    /// Optional CloudEvents `dataschema` attribute.
    dataschema: String

    /// Optional CloudEvents `datacontenttype` attribute.
    datacontenttype: String

    /// Optional event semantic version.
    version: String

    /// Optional transport topic (e.g., Kafka topic).
    topic: String
}
