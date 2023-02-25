using System.ComponentModel.DataAnnotations;

namespace Server.Models;

public class User
{
    public int Id { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? FirstName { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? LastName { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? Email { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? Password { get; set; }
    [StringLength(maximumLength: 15, MinimumLength = 1)]
    public string? PhoneNumber { get; set; }
    public bool HasAgreedToConditions { get; set; }
    public Languages Language { get; set; }
    public Address? Address { get; set; }
    public Settings? Settings { get; set; }
    public DateOnly BirthDate { get; set; }
    public Reminder[]? Reminders { get; set; }
}