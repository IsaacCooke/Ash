using Microsoft.AspNetCore.Mvc;
using Server.Speech;
using Server.Models.Speech;

namespace Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class SpeechController: ControllerBase
{
    [HttpPost]
    public async Task<ActionResult<Intent>> ParseIntent([FromBody] Phrase phrase)
    {
        Intent _intent = new Intent();

        var data = new Phrases.ModelInput()
        {
            Phrase = phrase.Text!
        };

        var result = Phrases.Predict(data);
        _intent.IntentNum = Convert.ToInt32(result.PredictedLabel);
        return Ok(_intent);
    }
}