using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Server.Models;

public class Address
{
    public int? HouseNumber { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    [BsonElement("Name")]
    public string? HouseName { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 0)]
    public string? Street { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? County { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? Country { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? PostCode { get; set; }
    public Location? Location { get; set; }
}