using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Server.Models;

public class Address
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? AddressId { get; set; }
    public int HouseNumber { get; set; }
    public string? HouseName { get; set; }
    public string? Street { get; set; }
    public string? County { get; set; }
    public string? Country { get; set; }
    public string? PostCode { get; set; }
    public Location? Location { get; set; }
}