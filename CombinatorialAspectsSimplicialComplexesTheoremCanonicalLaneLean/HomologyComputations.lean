import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexDefinition

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure SimplicialHomologyPackage {K : SimplicialComplex} where
  chainComplex : Type u
  homologyGroups : Type v
  eulerCharacteristic : ℤ
  bettiNumbers : List ℕ
  homologyComputed : Prop

structure SimplicialHomologyEvidence {K : SimplicialComplex} (H : SimplicialHomologyPackage K) where
  homologyComputedClosed : H.homologyComputed
  eulerCharacteristicMatches : H.eulerCharacteristic = ∑ b in H.bettiNumbers, ((-1 : ℤ) ^ (b : ℕ))

def SimplicialHomologyClosed {K : SimplicialComplex} (H : SimplicialHomologyPackage K) : Prop :=
  H.homologyComputed ∧ H.eulerCharacteristic = ∑ b in H.bettiNumbers, ((-1 : ℤ) ^ (b : ℕ))

theorem simplicial_homology_closed_from_evidence {K : SimplicialComplex} (H : SimplicialHomologyPackage K) (E : SimplicialHomologyEvidence H) :
    SimplicialHomologyClosed H := by
  exact And.intro E.homologyComputedClosed E.eulerCharacteristicMatches

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse