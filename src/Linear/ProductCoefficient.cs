// Copyright (c) 2014-2025 Sarin Na Wangkanai, All Rights Reserved.

namespace Wangkanai.Solver.Linear;

public class ProductCoefficient(LinearExpression expression, double coefficient)
   : LinearExpression
{
   public override string ToString()
      => $"({expression}*{coefficient})";

   public override double DoVisit(Dictionary<Variable, double> coefficients, double multiplier)
   {
      var currentMultiplier = multiplier * coefficient;
      return currentMultiplier != 0.0
         ? expression.DoVisit(coefficients, currentMultiplier)
         : 0.0;
   }
}