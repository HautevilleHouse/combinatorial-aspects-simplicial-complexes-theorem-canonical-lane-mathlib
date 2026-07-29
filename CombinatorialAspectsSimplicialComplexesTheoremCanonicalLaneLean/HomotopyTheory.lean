import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

open SimplicialComplex

structure HomotopyEquivalence (K L : SimplicialComplex) where
  map : K.simplices → L.simplices
  homotopyInverse : Prop

structure StrongDeformationRetract (K L : SimplicialComplex) where
  inclusion : K.simplices ⊆ L.simplices
  retraction : HomotopyEquivalence K L

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse