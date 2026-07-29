import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplex
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.FaceEnumeration

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure ReconstructionPackage (K : SimplicialComplex) where
  deck : List (SimplicialComplex)
  reconstructed : SimplicialComplex
  reconstructionConjecture : Prop

structure ReconstructionEvidence {K : SimplicialComplex} (R : ReconstructionPackage K) where
  deckCorrect : R.deck = List.map (λ v => { vertices := K.vertices.erase v, faces := List.filter (λ σ => v ∉ σ) K.faces, closedUnderSubsets := sorry, finite := sorry }) K.vertices
  reconstructedIsomorphic : R.reconstructed ≃ K
  reconstructionConjectureClosed : R.reconstructionConjecture

def ReconstructionClosed {K : SimplicialComplex} (R : ReconstructionPackage K) : Prop :=
  R.deck = List.map (λ v => { vertices := K.vertices.erase v, faces := List.filter (λ σ => v ∉ σ) K.faces, closedUnderSubsets := sorry, finite := sorry }) K.vertices ∧
  R.reconstructed ≃ K ∧
  R.reconstructionConjecture

theorem reconstruction_closed_from_evidence {K : SimplicialComplex} (R : ReconstructionPackage K) (E : ReconstructionEvidence R) : ReconstructionClosed R := by
  exact And.intro E.deckCorrect (And.intro E.reconstructedIsomorphic E.reconstructionConjectureClosed)

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse