import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

open SimplicialComplex

structure FaceRing (K : SimplicialComplex) (R : Type u) [CommRing R] where
  polynomialRing : Type v
  idealGenerators : List (polynomialRing)
  quotientRing : Type w

structure CohenMacaulayProperty (K : SimplicialComplex) (R : Type u) [CommRing R] where
  faceRing_depth : Nat
  depth_eq_dimension : Prop

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse