import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure SimplicialChainComplexPackage where
  dimension : ℕ
  freeAbelianGroups : ℕ → Type
  boundaryMaps : ℕ → (freeAbelianGroups (dimension+1) → freeAbelianGroups dimension)
  boundarySquareZero : ∀ n, boundaryMaps (n+1) ∘ boundaryMaps n = 0

structure SimplicialHomologyPackage (C : SimplicialChainComplexPackage) where
  cycles : ℕ → Type
  boundaries : ℕ → Type
  homologyGroups : ℕ → Type
  cyclesClosed : Prop
  boundariesClosed : Prop
  homologyWellDefined : Prop

structure SimplicialHomologyEvidence {C : SimplicialChainComplexPackage} (H : SimplicialHomologyPackage C) where
  cyclesClosedTerm : H.cyclesClosed
  boundariesClosedTerm : H.boundariesClosed
  homologyWellDefinedTerm : H.homologyWellDefined

def SimplicialHomologyClosed {C : SimplicialChainComplexPackage} (H : SimplicialHomologyPackage C) : Prop :=
  H.cyclesClosed ∧ H.boundariesClosed ∧ H.homologyWellDefined

theorem simplicial_homology_closed_from_evidence {C : SimplicialChainComplexPackage} (H : SimplicialHomologyPackage C) (E : SimplicialHomologyEvidence H) : SimplicialHomologyClosed H := by
  exact And.intro E.cyclesClosedTerm (And.intro E.boundariesClosedTerm E.homologyWellDefinedTerm)

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse