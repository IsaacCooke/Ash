using Microsoft.ML;
using Microsoft.ML.Data;
using System;
using System.Linq;
using System.IO;
using System.Collections.Generic;

namespace Server.Language
{
    public partial class Phrases
    {
        /// <summary>
        /// model input class for Phrases.
        /// </summary>
        #region model input class
        public class ModelInput
        {
            [ColumnName(@"phrase")]
            public string Phrase { get; set; }

            [ColumnName(@"val")]
            public float Val { get; set; }

        }

        #endregion

        /// <summary>
        /// model output class for Phrases.
        /// </summary>
        #region model output class
        public class ModelOutput
        {
            [ColumnName(@"phrase")]
            public float[] Phrase { get; set; }

            [ColumnName(@"val")]
            public uint Val { get; set; }

            [ColumnName(@"Features")]
            public float[] Features { get; set; }

            [ColumnName(@"PredictedLabel")]
            public float PredictedLabel { get; set; }

            [ColumnName(@"Score")]
            public float[] Score { get; set; }

        }

        #endregion

        private static string MLNetModelPath = Path.GetFullPath("Phrases.zip");

        public static readonly Lazy<PredictionEngine<ModelInput, ModelOutput>> PredictEngine = new Lazy<PredictionEngine<ModelInput, ModelOutput>>(() => CreatePredictEngine(), true);

        /// <summary>
        /// Use this method to predict on <see cref="ModelInput"/>.
        /// </summary>
        /// <param name="input">model input.</param>
        /// <returns><seealso cref=" ModelOutput"/></returns>
        public static ModelOutput Predict(ModelInput input)
        {
            var predEngine = PredictEngine.Value;
            return predEngine.Predict(input);
        }

        private static PredictionEngine<ModelInput, ModelOutput> CreatePredictEngine()
        {
            var mlContext = new MLContext();
            ITransformer mlModel = mlContext.Model.Load(MLNetModelPath, out var _);
            return mlContext.Model.CreatePredictionEngine<ModelInput, ModelOutput>(mlModel);
        }
    }
}
