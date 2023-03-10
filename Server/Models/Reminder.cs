using System.ComponentModel.DataAnnotations;

namespace Server.Models;

public class Reminder
{
    public int Id { get; set; }
    [StringLength(maximumLength: 50, MinimumLength = 1)]
    public string? Title { get; set; }
    public DateTime DateDue { get; set; }
    public Repeat? Repeat { get; set; }
    [StringLength(maximumLength: 1023, MinimumLength = 0)]
    public string? Notes { get; set; }
}

public enum Repeat
{
    // Null: 0
    None, // 1
    Daily, // 2
    Weekly, // 3
    Monthly, // 4
    Weekdays, // 5
    Weekends, // 6
    Yearly // 7
}