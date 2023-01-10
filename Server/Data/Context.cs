using Microsoft.EntityFrameworkCore;
using Server.Models;

namespace Server.Data;

public class Context: DbContext
{
    public Context(DbContextOptions<Context> options): base(options)
    {
    }

    public DbSet<User>? User { get; set; }
    public DbSet<Address>? Address { get; set; }
    public DbSet<Reminder>? Reminder { get; set; }
    public DbSet<Settings>? Settings { get; set; }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>().ToTable("User");
        modelBuilder.Entity<Address>().ToTable("Address");
        modelBuilder.Entity<Reminder>().ToTable("Reminder");
        modelBuilder.Entity<Settings>().ToTable("Settings");
    }
}