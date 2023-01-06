using System;
using Newtonsoft.Json.Linq;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Server.Services;
using Server.Models;

namespace Server.Controllers;

[Route("api/[controller]/")]
[ApiController]
public class LanguageController : ControllerBase
{
    private readonly SpeechService _speechService;

    [HttpPost]
    public async Task<ActionResult<Phrase>> ReceiveWebhook(Phrase phrase)
    {
        var text = phrase.text;

        int result = _speechService.GetIntent(text);
        return Ok(new {result});
    }
}