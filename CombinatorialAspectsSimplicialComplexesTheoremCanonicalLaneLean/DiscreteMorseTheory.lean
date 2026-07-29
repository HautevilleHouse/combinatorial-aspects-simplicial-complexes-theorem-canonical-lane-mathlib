import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialHomology

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure GradientVectorFieldPackage {C : SimplicialChainComplexPackage} (H : SimplicialHomologyPackage C) where
  criticalCells : ℕ → Type
  gradientFlow : Type
  morseInequalities : Prop
  discreteMorseFunction : Prop

structure DiscreteMorseEvidence {C : SimplicialChainComplexPackage} {H : SimplicialHomologyPackage C} (G : GradientVectorFieldPackage H) where
  criticalCellsClosed : Prop
  gradientFlowClosed : Prop
  morseInequalitiesClosed : G.morseInequalities
  discreteMorseFunctionClosed : G.discreteMorseFunction

def DiscreteMorseClosed {C : SimplicialChainComplexPackage} {H : SimplicialHomologyPackage C} (G : GradientVectorFieldPackage H) : Prop :=
  G.morseInequalities ∧ G.discreteMorseFunction

theorem discrete_morse_closed_from_evidence {C : SimplicialChainComplexPackage} {H : SimplicialHomologyPackage C} (G : GradientVectorFieldPackage H) (E : DiscreteMorseEvidence G) : DiscreteMorseClosed G := by
  exact And.intro E.morseInequalitiesClosed E.discreteMorseFunctionClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse