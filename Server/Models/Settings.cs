using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Server.Models;

public class Settings
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? SettingsId { get; set; }
    public string? VoiceId { get; set; }
    public bool StaySignedIn { get; set; }
}