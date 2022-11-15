//! generated by zig-lsp-codegen

const std = @import("std");
const tres = @import("tres");
const Undefinedable = tres.Undefinedable;

const URI = []const u8;
/// The URI of a document
pub const DocumentUri = []const u8;
/// A JavaScript regular expression; never used
pub const RegExp = []const u8;

pub const LSPAny = std.json.Value;
pub const LSPArray = []LSPAny;
pub const LSPObject = std.json.ObjectMap;

pub fn Map(comptime Key: type, comptime Value: type) type {
    if (Key == []const u8)
        return std.StringHashMap(Value)
    else
        return std.AutoHashMap(Key, Value);
}

pub const RequestId = union(enum) {
    integer: i64,
    string: []const u8,
};

pub const ResponseError = struct {
    /// A number indicating the error type that occurred.
    code: i64,
    /// A string providing a short description of the error.
    message: []const u8,

    /// A primitive or structured value that contains additional
    /// information about the error. Can be omitted.
    data: std.json.Value = .Null,
};

pub const MessageDirection = enum {
    client_to_server,
    server_to_client,
    bidirectional,
};

pub const RegistrationMetadata = struct {
    method: ?[]const u8,
    Options: ?type,
};

pub const NotificationMetadata = struct {
    method: []const u8,
    documentation: ?[]const u8,
    direction: MessageDirection,
    Params: ?type,
    registration: RegistrationMetadata,
};

pub const RequestMetadata = struct {
    method: []const u8,
    documentation: ?[]const u8,
    direction: MessageDirection,
    Params: ?type,
    Result: type,
    PartialResult: ?type,
    ErrorData: ?type,
    registration: RegistrationMetadata,
};

test {
    _ = @field(@This(), "notification_metadata");
    _ = @field(@This(), "request_metadata");
}
