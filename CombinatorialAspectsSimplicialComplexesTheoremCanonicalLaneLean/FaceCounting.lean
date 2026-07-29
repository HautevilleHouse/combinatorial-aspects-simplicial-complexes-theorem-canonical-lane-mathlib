import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplexStructure

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure FaceCountingPackage (S : SimplicialComplexPackage) where
  fVector : List ℕ
  dehnSommervilleRelations : Prop
  faceEnumerationCorrect : Prop

structure FaceCountingEvidence {S : SimplicialComplexPackage}
    (F : FaceCountingPackage S) where
  dehnSommervilleRelationsClosed : F.dehnSommervilleRelations
  faceEnumerationCorrectClosed : F.faceEnumerationCorrect

def FaceCountingClosed {S : SimplicialComplexPackage}
    (F : FaceCountingPackage S) : Prop :=
  F.dehnSommervilleRelations ∧ F.faceEnumerationCorrect

theorem face_counting_closed_from_evidence {S : SimplicialComplexPackage}
    (F : FaceCountingPackage S) (E : FaceCountingEvidence F) :
    FaceCountingClosed F := by
  exact And.intro E.dehnSommervilleRelationsClosed E.faceEnumerationCorrectClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse
