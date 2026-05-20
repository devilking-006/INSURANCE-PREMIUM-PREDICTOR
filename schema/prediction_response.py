"""
In FastAPI, a response model defines the structure of the data that your API endpoint will return. It helps in :

    - Generating clean API docs (/docs).
    - Validating output (so your API doesn't return malformed responses).
    - Filtering unnecessary data from the response.

"""

from pydantic import BaseModel, Field
from typing import Dict

class PredictionResponse(BaseModel):

    predicted_category: str = Field(
        ...,
        description="The predicted insurance premium category",
        example="High"
    )

    confidence: float = Field(
        ...,
        description="Model's confidence score for the predicted class (range: 0 to 1)",
        example= 0.8432
    )

    class_probabilities: Dict[str, float] = Field(
        ...,
        description="Probability distribution across all possible classes",
        example={"Low" : 0.01, "Medium" : 0.15, "High" : 0.84}
    )