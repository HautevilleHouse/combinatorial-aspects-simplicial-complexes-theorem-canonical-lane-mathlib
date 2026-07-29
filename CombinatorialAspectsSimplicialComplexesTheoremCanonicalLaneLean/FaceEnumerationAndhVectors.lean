import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexDefinition

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure FaceEnumerationPackage {K : SimplicialComplex} where
  fVector : List ℕ
  hVector : List ℤ
  dehnSommervilleRelations : Prop
  unimodality : Prop

structure FaceEnumerationEvidence {K : SimplicialComplex} (F : FaceEnumerationPackage K) where
  dehnSommervilleRelationsClosed : F.dehnSommervilleRelations
  unimodalityClosed : F.unimodality
  hvectorFromFvector : F.hVector = List.map (λ i => ∑ j in List.range (i+1), ((-1 : ℤ) ^ (i-j : ℕ)) * (F.fVector.get? j).getD 0) (List.range (F.fVector.length))

def FaceEnumerationClosed {K : SimplicialComplex} (F : FaceEnumerationPackage K) : Prop :=
  F.dehnSommervilleRelations ∧ F.unimodality ∧ F.hVector = List.map (λ i => ∑ j in List.range (i+1), ((-1 : ℤ) ^ (i-j : ℕ)) * (F.fVector.get? j).getD 0) (List.range (F.fVector.length))

theorem face_enumeration_closed_from_evidence {K : SimplicialComplex} (F : FaceEnumerationPackage K) (E : FaceEnumerationEvidence F) :
    FaceEnumerationClosed F := by
  exact And.intro E.dehnSommervilleRelationsClosed (And.intro E.unimodalityClosed E.hvectorFromFvector)

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse