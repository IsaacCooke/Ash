namespace Server.Models;

public class Settings
{
    public int Id { get; set; }
    public string? VoiceId { get; set; }
    public bool StaySignedIn { get; set; }
}