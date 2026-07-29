import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.Shellability

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure FVectorPackage where
  simplexDimension : ℕ
  faceNumbers : ℕ → ℕ
  fVectorExpression : ℕ → ℕ
  fVectorClosed : Prop

structure FVectorEvidence (F : FVectorPackage) where
  faceNumbersClosed : ∀ i, F.faceNumbers i = F.fVectorExpression i
  fVectorClosedTerm : F.fVectorClosed

def FVectorClosed (F : FVectorPackage) : Prop :=
  F.fVectorClosed

theorem f_vector_closed_from_evidence (F : FVectorPackage) (E : FVectorEvidence F) : FVectorClosed F := by
  exact E.fVectorClosedTerm

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse