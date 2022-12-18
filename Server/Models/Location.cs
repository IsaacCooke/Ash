using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Server.Models;

public class Location
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? LocationId { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}