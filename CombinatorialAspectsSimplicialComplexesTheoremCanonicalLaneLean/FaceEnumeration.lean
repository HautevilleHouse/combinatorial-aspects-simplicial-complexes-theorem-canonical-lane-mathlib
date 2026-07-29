import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplex

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure FaceEnumerationPackage (K : SimplicialComplex) where
  fVector : List ℕ
  eulerCharacteristic : ℤ
  kNumber : ℕ → ℕ
  reducedEuler : ℤ

structure FaceEnumerationEvidence {K : SimplicialComplex} (F : FaceEnumerationPackage K) where
  fVectorCorrect : F.fVector = List.map (λ d => (List.filter (λ σ => σ.length = d) K.faces).length) (List.range (K.faces.map List.length).maximum?)
  eulerCharacteristicCorrect : F.eulerCharacteristic = (∑_{i=0}^{dim} (-1)^i * (F.fVector.get? i).getD 0)
  kNumberCorrect : ∀ d, F.kNumber d = (List.filter (λ σ => σ.length = d) K.faces).length
  reducedEulerCorrect : F.reducedEuler = F.eulerCharacteristic - 1

def FaceEnumerationClosed {K : SimplicialComplex} (F : FaceEnumerationPackage K) : Prop :=
  F.fVector = List.map (λ d => (List.filter (λ σ => σ.length = d) K.faces).length) (List.range (K.faces.map List.length).maximum?) ∧
  F.eulerCharacteristic = (∑_{i=0}^{dim} (-1)^i * (F.fVector.get? i).getD 0) ∧
  (∀ d, F.kNumber d = (List.filter (λ σ => σ.length = d) K.faces).length) ∧
  F.reducedEuler = F.eulerCharacteristic - 1

theorem face_enumeration_closed_from_evidence {K : SimplicialComplex} (F : FaceEnumerationPackage K) (E : FaceEnumerationEvidence F) : FaceEnumerationClosed F := by
  exact And.intro E.fVectorCorrect (And.intro E.eulerCharacteristicCorrect (And.intro E.kNumberCorrect E.reducedEulerCorrect))

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse