using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Server.Migrations
{
    /// <inheritdoc />
    public partial class RemovedLocation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Address_Location_LocationId",
                table: "Address");

            migrationBuilder.DropForeignKey(
                name: "FK_Reminder_Location_LocationId",
                table: "Reminder");

            migrationBuilder.DropTable(
                name: "Location");

            migrationBuilder.DropIndex(
                name: "IX_Reminder_LocationId",
                table: "Reminder");

            migrationBuilder.DropIndex(
                name: "IX_Address_LocationId",
                table: "Address");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "User");

            migrationBuilder.DropColumn(
                name: "LocationId",
                table: "Reminder");

            migrationBuilder.DropColumn(
                name: "LocationId",
                table: "Address");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "User",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LocationId",
                table: "Reminder",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LocationId",
                table: "Address",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Location",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Latitude = table.Column<double>(type: "double precision", nullable: false),
                    Longitude = table.Column<double>(type: "double precision", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Location", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Reminder_LocationId",
                table: "Reminder",
                column: "LocationId");

            migrationBuilder.CreateIndex(
                name: "IX_Address_LocationId",
                table: "Address",
                column: "LocationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Address_Location_LocationId",
                table: "Address",
                column: "LocationId",
                principalTable: "Location",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Reminder_Location_LocationId",
                table: "Reminder",
                column: "LocationId",
                principalTable: "Location",
                principalColumn: "Id");
        }
    }
}
