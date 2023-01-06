using Server.Language;

namespace Server.Services;

public class SpeechService
{
    public int GetIntent(string phrase)
    {
        var data = new Phrases.ModelInput()
        {
            Phrase = phrase,
        };

        var result = Phrases.Predict(data);

        return (int)result.PredictedLabel;
    }
}