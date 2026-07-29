import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure TopologicalInvariantsPackage {S : SimplicialComplexPackage} where
  eulerCharacteristic : Prop
  bettiNumbers : Prop
  fundamentalGroup : Type u
  homologyCalculated : Prop
  homotopyTypeDetermined : Prop

structure TopologicalInvariantsEvidence {S : SimplicialComplexPackage}
    (T : TopologicalInvariantsPackage S) where
  eulerCharacteristicClosed : T.eulerCharacteristic
  bettiNumbersClosed : T.bettiNumbers
  homologyCalculatedClosed : T.homologyCalculated
  homotopyTypeDeterminedClosed : T.homotopyTypeDetermined

def TopologicalInvariantsClosed {S : SimplicialComplexPackage}
    (T : TopologicalInvariantsPackage S) : Prop :=
  T.eulerCharacteristic ∧ T.bettiNumbers ∧ T.homologyCalculated ∧ T.homotopyTypeDetermined

theorem topological_invariants_closed_from_evidence
    {S : SimplicialComplexPackage} (T : TopologicalInvariantsPackage S)
    (E : TopologicalInvariantsEvidence T) : TopologicalInvariantsClosed T := by
  exact And.intro E.eulerCharacteristicClosed
    (And.intro E.bettiNumbersClosed
      (And.intro E.homologyCalculatedClosed E.homotopyTypeDeterminedClosed))

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse
