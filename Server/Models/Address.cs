using System.ComponentModel.DataAnnotations;

namespace Server.Models;

public class Address
{
    public int Id { get; set; }
    public int? HouseNumber { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? HouseName { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 0)]
    public string? Street { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? County { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? Country { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? PostCode { get; set; }
}