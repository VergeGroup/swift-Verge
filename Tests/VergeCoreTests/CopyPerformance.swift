//
//  CopyPerformance.swift
//  VergeCore
//
//  Created by muukii on 2020/01/08.
//  Copyright © 2020 muukii. All rights reserved.
//

import Foundation

import XCTest

final class CopyPerformance: XCTestCase {
  
  private let source = Huge()
  
  func testCopy() {
    
    measure {
      run(with: source)
    }
  }
  
  func testCopyWithShared() {
    
    let huge = Shared(source)
    measure {
      run(with: huge)
    }
  }
  
  func testAny() {
    measure {
      run(any: source)
    }
  }
  
  func testAnyWithShared() {
    let huge = Shared(source)
    measure {
      run(anyObject: huge)
    }
  }
  
  private func run(anyObject: AnyObject) {
    let value = anyObject as! Shared<Huge>
    _ = value.value.value_0
  }
  
  private func run(any: Any) {
  }
  
  private func run(with huge: Huge) {
    let _ = huge.value_0
  }
  
  private func run(with huge: Shared<Huge>) {
    let _ = huge.value.value_0
  }
  
  final class Shared<V> {
    let value: V
    init(_ value: V) {
      self.value = value
    }
  }
  
  struct Huge {
    var value_0: Int = 1
    var value_1: Int = 1
    var value_2: Int = 1
    var value_3: Int = 1
    var value_4: Int = 1
    var value_5: Int = 1
    var value_6: Int = 1
    var value_7: Int = 1
    var value_8: Int = 1
    var value_9: Int = 1
    var value_10: Int = 1
    var value_11: Int = 1
    var value_12: Int = 1
    var value_13: Int = 1
    var value_14: Int = 1
    var value_15: Int = 1
    var value_16: Int = 1
    var value_17: Int = 1
    var value_18: Int = 1
    var value_19: Int = 1
    var value_20: Int = 1
    var value_21: Int = 1
    var value_22: Int = 1
    var value_23: Int = 1
    var value_24: Int = 1
    var value_25: Int = 1
    var value_26: Int = 1
    var value_27: Int = 1
    var value_28: Int = 1
    var value_29: Int = 1
    var value_30: Int = 1
    var value_31: Int = 1
    var value_32: Int = 1
    var value_33: Int = 1
    var value_34: Int = 1
    var value_35: Int = 1
    var value_36: Int = 1
    var value_37: Int = 1
    var value_38: Int = 1
    var value_39: Int = 1
    var value_40: Int = 1
    var value_41: Int = 1
    var value_42: Int = 1
    var value_43: Int = 1
    var value_44: Int = 1
    var value_45: Int = 1
    var value_46: Int = 1
    var value_47: Int = 1
    var value_48: Int = 1
    var value_49: Int = 1
    var value_50: Int = 1
    var value_51: Int = 1
    var value_52: Int = 1
    var value_53: Int = 1
    var value_54: Int = 1
    var value_55: Int = 1
    var value_56: Int = 1
    var value_57: Int = 1
    var value_58: Int = 1
    var value_59: Int = 1
    var value_60: Int = 1
    var value_61: Int = 1
    var value_62: Int = 1
    var value_63: Int = 1
    var value_64: Int = 1
    var value_65: Int = 1
    var value_66: Int = 1
    var value_67: Int = 1
    var value_68: Int = 1
    var value_69: Int = 1
    var value_70: Int = 1
    var value_71: Int = 1
    var value_72: Int = 1
    var value_73: Int = 1
    var value_74: Int = 1
    var value_75: Int = 1
    var value_76: Int = 1
    var value_77: Int = 1
    var value_78: Int = 1
    var value_79: Int = 1
    var value_80: Int = 1
    var value_81: Int = 1
    var value_82: Int = 1
    var value_83: Int = 1
    var value_84: Int = 1
    var value_85: Int = 1
    var value_86: Int = 1
    var value_87: Int = 1
    var value_88: Int = 1
    var value_89: Int = 1
    var value_90: Int = 1
    var value_91: Int = 1
    var value_92: Int = 1
    var value_93: Int = 1
    var value_94: Int = 1
    var value_95: Int = 1
    var value_96: Int = 1
    var value_97: Int = 1
    var value_98: Int = 1
    var value_99: Int = 1
    var value_100: Int = 1
    var value_101: Int = 1
    var value_102: Int = 1
    var value_103: Int = 1
    var value_104: Int = 1
    var value_105: Int = 1
    var value_106: Int = 1
    var value_107: Int = 1
    var value_108: Int = 1
    var value_109: Int = 1
    var value_110: Int = 1
    var value_111: Int = 1
    var value_112: Int = 1
    var value_113: Int = 1
    var value_114: Int = 1
    var value_115: Int = 1
    var value_116: Int = 1
    var value_117: Int = 1
    var value_118: Int = 1
    var value_119: Int = 1
    var value_120: Int = 1
    var value_121: Int = 1
    var value_122: Int = 1
    var value_123: Int = 1
    var value_124: Int = 1
    var value_125: Int = 1
    var value_126: Int = 1
    var value_127: Int = 1
    var value_128: Int = 1
    var value_129: Int = 1
    var value_130: Int = 1
    var value_131: Int = 1
    var value_132: Int = 1
    var value_133: Int = 1
    var value_134: Int = 1
    var value_135: Int = 1
    var value_136: Int = 1
    var value_137: Int = 1
    var value_138: Int = 1
    var value_139: Int = 1
    var value_140: Int = 1
    var value_141: Int = 1
    var value_142: Int = 1
    var value_143: Int = 1
    var value_144: Int = 1
    var value_145: Int = 1
    var value_146: Int = 1
    var value_147: Int = 1
    var value_148: Int = 1
    var value_149: Int = 1
    var value_150: Int = 1
    var value_151: Int = 1
    var value_152: Int = 1
    var value_153: Int = 1
    var value_154: Int = 1
    var value_155: Int = 1
    var value_156: Int = 1
    var value_157: Int = 1
    var value_158: Int = 1
    var value_159: Int = 1
    var value_160: Int = 1
    var value_161: Int = 1
    var value_162: Int = 1
    var value_163: Int = 1
    var value_164: Int = 1
    var value_165: Int = 1
    var value_166: Int = 1
    var value_167: Int = 1
    var value_168: Int = 1
    var value_169: Int = 1
    var value_170: Int = 1
    var value_171: Int = 1
    var value_172: Int = 1
    var value_173: Int = 1
    var value_174: Int = 1
    var value_175: Int = 1
    var value_176: Int = 1
    var value_177: Int = 1
    var value_178: Int = 1
    var value_179: Int = 1
    var value_180: Int = 1
    var value_181: Int = 1
    var value_182: Int = 1
    var value_183: Int = 1
    var value_184: Int = 1
    var value_185: Int = 1
    var value_186: Int = 1
    var value_187: Int = 1
    var value_188: Int = 1
    var value_189: Int = 1
    var value_190: Int = 1
    var value_191: Int = 1
    var value_192: Int = 1
    var value_193: Int = 1
    var value_194: Int = 1
    var value_195: Int = 1
    var value_196: Int = 1
    var value_197: Int = 1
    var value_198: Int = 1
    var value_199: Int = 1
    var value_200: Int = 1
    var value_201: Int = 1
    var value_202: Int = 1
    var value_203: Int = 1
    var value_204: Int = 1
    var value_205: Int = 1
    var value_206: Int = 1
    var value_207: Int = 1
    var value_208: Int = 1
    var value_209: Int = 1
    var value_210: Int = 1
    var value_211: Int = 1
    var value_212: Int = 1
    var value_213: Int = 1
    var value_214: Int = 1
    var value_215: Int = 1
    var value_216: Int = 1
    var value_217: Int = 1
    var value_218: Int = 1
    var value_219: Int = 1
    var value_220: Int = 1
    var value_221: Int = 1
    var value_222: Int = 1
    var value_223: Int = 1
    var value_224: Int = 1
    var value_225: Int = 1
    var value_226: Int = 1
    var value_227: Int = 1
    var value_228: Int = 1
    var value_229: Int = 1
    var value_230: Int = 1
    var value_231: Int = 1
    var value_232: Int = 1
    var value_233: Int = 1
    var value_234: Int = 1
    var value_235: Int = 1
    var value_236: Int = 1
    var value_237: Int = 1
    var value_238: Int = 1
    var value_239: Int = 1
    var value_240: Int = 1
    var value_241: Int = 1
    var value_242: Int = 1
    var value_243: Int = 1
    var value_244: Int = 1
    var value_245: Int = 1
    var value_246: Int = 1
    var value_247: Int = 1
    var value_248: Int = 1
    var value_249: Int = 1
    var value_250: Int = 1
    var value_251: Int = 1
    var value_252: Int = 1
    var value_253: Int = 1
    var value_254: Int = 1
    var value_255: Int = 1
    var value_256: Int = 1
    var value_257: Int = 1
    var value_258: Int = 1
    var value_259: Int = 1
    var value_260: Int = 1
    var value_261: Int = 1
    var value_262: Int = 1
    var value_263: Int = 1
    var value_264: Int = 1
    var value_265: Int = 1
    var value_266: Int = 1
    var value_267: Int = 1
    var value_268: Int = 1
    var value_269: Int = 1
    var value_270: Int = 1
    var value_271: Int = 1
    var value_272: Int = 1
    var value_273: Int = 1
    var value_274: Int = 1
    var value_275: Int = 1
    var value_276: Int = 1
    var value_277: Int = 1
    var value_278: Int = 1
    var value_279: Int = 1
    var value_280: Int = 1
    var value_281: Int = 1
    var value_282: Int = 1
    var value_283: Int = 1
    var value_284: Int = 1
    var value_285: Int = 1
    var value_286: Int = 1
    var value_287: Int = 1
    var value_288: Int = 1
    var value_289: Int = 1
    var value_290: Int = 1
    var value_291: Int = 1
    var value_292: Int = 1
    var value_293: Int = 1
    var value_294: Int = 1
    var value_295: Int = 1
    var value_296: Int = 1
    var value_297: Int = 1
    var value_298: Int = 1
    var value_299: Int = 1
    var value_300: Int = 1
    var value_301: Int = 1
    var value_302: Int = 1
    var value_303: Int = 1
    var value_304: Int = 1
    var value_305: Int = 1
    var value_306: Int = 1
    var value_307: Int = 1
    var value_308: Int = 1
    var value_309: Int = 1
    var value_310: Int = 1
    var value_311: Int = 1
    var value_312: Int = 1
    var value_313: Int = 1
    var value_314: Int = 1
    var value_315: Int = 1
    var value_316: Int = 1
    var value_317: Int = 1
    var value_318: Int = 1
    var value_319: Int = 1
    var value_320: Int = 1
    var value_321: Int = 1
    var value_322: Int = 1
    var value_323: Int = 1
    var value_324: Int = 1
    var value_325: Int = 1
    var value_326: Int = 1
    var value_327: Int = 1
    var value_328: Int = 1
    var value_329: Int = 1
    var value_330: Int = 1
    var value_331: Int = 1
    var value_332: Int = 1
    var value_333: Int = 1
    var value_334: Int = 1
    var value_335: Int = 1
    var value_336: Int = 1
    var value_337: Int = 1
    var value_338: Int = 1
    var value_339: Int = 1
    var value_340: Int = 1
    var value_341: Int = 1
    var value_342: Int = 1
    var value_343: Int = 1
    var value_344: Int = 1
    var value_345: Int = 1
    var value_346: Int = 1
    var value_347: Int = 1
    var value_348: Int = 1
    var value_349: Int = 1
    var value_350: Int = 1
    var value_351: Int = 1
    var value_352: Int = 1
    var value_353: Int = 1
    var value_354: Int = 1
    var value_355: Int = 1
    var value_356: Int = 1
    var value_357: Int = 1
    var value_358: Int = 1
    var value_359: Int = 1
    var value_360: Int = 1
    var value_361: Int = 1
    var value_362: Int = 1
    var value_363: Int = 1
    var value_364: Int = 1
    var value_365: Int = 1
    var value_366: Int = 1
    var value_367: Int = 1
    var value_368: Int = 1
    var value_369: Int = 1
    var value_370: Int = 1
    var value_371: Int = 1
    var value_372: Int = 1
    var value_373: Int = 1
    var value_374: Int = 1
    var value_375: Int = 1
    var value_376: Int = 1
    var value_377: Int = 1
    var value_378: Int = 1
    var value_379: Int = 1
    var value_380: Int = 1
    var value_381: Int = 1
    var value_382: Int = 1
    var value_383: Int = 1
    var value_384: Int = 1
    var value_385: Int = 1
    var value_386: Int = 1
    var value_387: Int = 1
    var value_388: Int = 1
    var value_389: Int = 1
    var value_390: Int = 1
    var value_391: Int = 1
    var value_392: Int = 1
    var value_393: Int = 1
    var value_394: Int = 1
    var value_395: Int = 1
    var value_396: Int = 1
    var value_397: Int = 1
    var value_398: Int = 1
    var value_399: Int = 1
    var value_400: Int = 1
    var value_401: Int = 1
    var value_402: Int = 1
    var value_403: Int = 1
    var value_404: Int = 1
    var value_405: Int = 1
    var value_406: Int = 1
    var value_407: Int = 1
    var value_408: Int = 1
    var value_409: Int = 1
    var value_410: Int = 1
    var value_411: Int = 1
    var value_412: Int = 1
    var value_413: Int = 1
    var value_414: Int = 1
    var value_415: Int = 1
    var value_416: Int = 1
    var value_417: Int = 1
    var value_418: Int = 1
    var value_419: Int = 1
    var value_420: Int = 1
    var value_421: Int = 1
    var value_422: Int = 1
    var value_423: Int = 1
    var value_424: Int = 1
    var value_425: Int = 1
    var value_426: Int = 1
    var value_427: Int = 1
    var value_428: Int = 1
    var value_429: Int = 1
    var value_430: Int = 1
    var value_431: Int = 1
    var value_432: Int = 1
    var value_433: Int = 1
    var value_434: Int = 1
    var value_435: Int = 1
    var value_436: Int = 1
    var value_437: Int = 1
    var value_438: Int = 1
    var value_439: Int = 1
    var value_440: Int = 1
    var value_441: Int = 1
    var value_442: Int = 1
    var value_443: Int = 1
    var value_444: Int = 1
    var value_445: Int = 1
    var value_446: Int = 1
    var value_447: Int = 1
    var value_448: Int = 1
    var value_449: Int = 1
    var value_450: Int = 1
    var value_451: Int = 1
    var value_452: Int = 1
    var value_453: Int = 1
    var value_454: Int = 1
    var value_455: Int = 1
    var value_456: Int = 1
    var value_457: Int = 1
    var value_458: Int = 1
    var value_459: Int = 1
    var value_460: Int = 1
    var value_461: Int = 1
    var value_462: Int = 1
    var value_463: Int = 1
    var value_464: Int = 1
    var value_465: Int = 1
    var value_466: Int = 1
    var value_467: Int = 1
    var value_468: Int = 1
    var value_469: Int = 1
    var value_470: Int = 1
    var value_471: Int = 1
    var value_472: Int = 1
    var value_473: Int = 1
    var value_474: Int = 1
    var value_475: Int = 1
    var value_476: Int = 1
    var value_477: Int = 1
    var value_478: Int = 1
    var value_479: Int = 1
    var value_480: Int = 1
    var value_481: Int = 1
    var value_482: Int = 1
    var value_483: Int = 1
    var value_484: Int = 1
    var value_485: Int = 1
    var value_486: Int = 1
    var value_487: Int = 1
    var value_488: Int = 1
    var value_489: Int = 1
    var value_490: Int = 1
    var value_491: Int = 1
    var value_492: Int = 1
    var value_493: Int = 1
    var value_494: Int = 1
    var value_495: Int = 1
    var value_496: Int = 1
    var value_497: Int = 1
    var value_498: Int = 1
    var value_499: Int = 1
    var value_500: Int = 1
    var value_501: Int = 1
    var value_502: Int = 1
    var value_503: Int = 1
    var value_504: Int = 1
    var value_505: Int = 1
    var value_506: Int = 1
    var value_507: Int = 1
    var value_508: Int = 1
    var value_509: Int = 1
    var value_510: Int = 1
    var value_511: Int = 1
    var value_512: Int = 1
    var value_513: Int = 1
    var value_514: Int = 1
    var value_515: Int = 1
    var value_516: Int = 1
    var value_517: Int = 1
    var value_518: Int = 1
    var value_519: Int = 1
    var value_520: Int = 1
    var value_521: Int = 1
    var value_522: Int = 1
    var value_523: Int = 1
    var value_524: Int = 1
    var value_525: Int = 1
    var value_526: Int = 1
    var value_527: Int = 1
    var value_528: Int = 1
    var value_529: Int = 1
    var value_530: Int = 1
    var value_531: Int = 1
    var value_532: Int = 1
    var value_533: Int = 1
    var value_534: Int = 1
    var value_535: Int = 1
    var value_536: Int = 1
    var value_537: Int = 1
    var value_538: Int = 1
    var value_539: Int = 1
    var value_540: Int = 1
    var value_541: Int = 1
    var value_542: Int = 1
    var value_543: Int = 1
    var value_544: Int = 1
    var value_545: Int = 1
    var value_546: Int = 1
    var value_547: Int = 1
    var value_548: Int = 1
    var value_549: Int = 1
    var value_550: Int = 1
    var value_551: Int = 1
    var value_552: Int = 1
    var value_553: Int = 1
    var value_554: Int = 1
    var value_555: Int = 1
    var value_556: Int = 1
    var value_557: Int = 1
    var value_558: Int = 1
    var value_559: Int = 1
    var value_560: Int = 1
    var value_561: Int = 1
    var value_562: Int = 1
    var value_563: Int = 1
    var value_564: Int = 1
    var value_565: Int = 1
    var value_566: Int = 1
    var value_567: Int = 1
    var value_568: Int = 1
    var value_569: Int = 1
    var value_570: Int = 1
    var value_571: Int = 1
    var value_572: Int = 1
    var value_573: Int = 1
    var value_574: Int = 1
    var value_575: Int = 1
    var value_576: Int = 1
    var value_577: Int = 1
    var value_578: Int = 1
    var value_579: Int = 1
    var value_580: Int = 1
    var value_581: Int = 1
    var value_582: Int = 1
    var value_583: Int = 1
    var value_584: Int = 1
    var value_585: Int = 1
    var value_586: Int = 1
    var value_587: Int = 1
    var value_588: Int = 1
    var value_589: Int = 1
    var value_590: Int = 1
    var value_591: Int = 1
    var value_592: Int = 1
    var value_593: Int = 1
    var value_594: Int = 1
    var value_595: Int = 1
    var value_596: Int = 1
    var value_597: Int = 1
    var value_598: Int = 1
    var value_599: Int = 1
    var value_600: Int = 1
    var value_601: Int = 1
    var value_602: Int = 1
    var value_603: Int = 1
    var value_604: Int = 1
    var value_605: Int = 1
    var value_606: Int = 1
    var value_607: Int = 1
    var value_608: Int = 1
    var value_609: Int = 1
    var value_610: Int = 1
    var value_611: Int = 1
    var value_612: Int = 1
    var value_613: Int = 1
    var value_614: Int = 1
    var value_615: Int = 1
    var value_616: Int = 1
    var value_617: Int = 1
    var value_618: Int = 1
    var value_619: Int = 1
    var value_620: Int = 1
    var value_621: Int = 1
    var value_622: Int = 1
    var value_623: Int = 1
    var value_624: Int = 1
    var value_625: Int = 1
    var value_626: Int = 1
    var value_627: Int = 1
    var value_628: Int = 1
    var value_629: Int = 1
    var value_630: Int = 1
    var value_631: Int = 1
    var value_632: Int = 1
    var value_633: Int = 1
    var value_634: Int = 1
    var value_635: Int = 1
    var value_636: Int = 1
    var value_637: Int = 1
    var value_638: Int = 1
    var value_639: Int = 1
    var value_640: Int = 1
    var value_641: Int = 1
    var value_642: Int = 1
    var value_643: Int = 1
    var value_644: Int = 1
    var value_645: Int = 1
    var value_646: Int = 1
    var value_647: Int = 1
    var value_648: Int = 1
    var value_649: Int = 1
    var value_650: Int = 1
    var value_651: Int = 1
    var value_652: Int = 1
    var value_653: Int = 1
    var value_654: Int = 1
    var value_655: Int = 1
    var value_656: Int = 1
    var value_657: Int = 1
    var value_658: Int = 1
    var value_659: Int = 1
    var value_660: Int = 1
    var value_661: Int = 1
    var value_662: Int = 1
    var value_663: Int = 1
    var value_664: Int = 1
    var value_665: Int = 1
    var value_666: Int = 1
    var value_667: Int = 1
    var value_668: Int = 1
    var value_669: Int = 1
    var value_670: Int = 1
    var value_671: Int = 1
    var value_672: Int = 1
    var value_673: Int = 1
    var value_674: Int = 1
    var value_675: Int = 1
    var value_676: Int = 1
    var value_677: Int = 1
    var value_678: Int = 1
    var value_679: Int = 1
    var value_680: Int = 1
    var value_681: Int = 1
    var value_682: Int = 1
    var value_683: Int = 1
    var value_684: Int = 1
    var value_685: Int = 1
    var value_686: Int = 1
    var value_687: Int = 1
    var value_688: Int = 1
    var value_689: Int = 1
    var value_690: Int = 1
    var value_691: Int = 1
    var value_692: Int = 1
    var value_693: Int = 1
    var value_694: Int = 1
    var value_695: Int = 1
    var value_696: Int = 1
    var value_697: Int = 1
    var value_698: Int = 1
    var value_699: Int = 1
    var value_700: Int = 1
    var value_701: Int = 1
    var value_702: Int = 1
    var value_703: Int = 1
    var value_704: Int = 1
    var value_705: Int = 1
    var value_706: Int = 1
    var value_707: Int = 1
    var value_708: Int = 1
    var value_709: Int = 1
    var value_710: Int = 1
    var value_711: Int = 1
    var value_712: Int = 1
    var value_713: Int = 1
    var value_714: Int = 1
    var value_715: Int = 1
    var value_716: Int = 1
    var value_717: Int = 1
    var value_718: Int = 1
    var value_719: Int = 1
    var value_720: Int = 1
    var value_721: Int = 1
    var value_722: Int = 1
    var value_723: Int = 1
    var value_724: Int = 1
    var value_725: Int = 1
    var value_726: Int = 1
    var value_727: Int = 1
    var value_728: Int = 1
    var value_729: Int = 1
    var value_730: Int = 1
    var value_731: Int = 1
    var value_732: Int = 1
    var value_733: Int = 1
    var value_734: Int = 1
    var value_735: Int = 1
    var value_736: Int = 1
    var value_737: Int = 1
    var value_738: Int = 1
    var value_739: Int = 1
    var value_740: Int = 1
    var value_741: Int = 1
    var value_742: Int = 1
    var value_743: Int = 1
    var value_744: Int = 1
    var value_745: Int = 1
    var value_746: Int = 1
    var value_747: Int = 1
    var value_748: Int = 1
    var value_749: Int = 1
    var value_750: Int = 1
    var value_751: Int = 1
    var value_752: Int = 1
    var value_753: Int = 1
    var value_754: Int = 1
    var value_755: Int = 1
    var value_756: Int = 1
    var value_757: Int = 1
    var value_758: Int = 1
    var value_759: Int = 1
    var value_760: Int = 1
    var value_761: Int = 1
    var value_762: Int = 1
    var value_763: Int = 1
    var value_764: Int = 1
    var value_765: Int = 1
    var value_766: Int = 1
    var value_767: Int = 1
    var value_768: Int = 1
    var value_769: Int = 1
    var value_770: Int = 1
    var value_771: Int = 1
    var value_772: Int = 1
    var value_773: Int = 1
    var value_774: Int = 1
    var value_775: Int = 1
    var value_776: Int = 1
    var value_777: Int = 1
    var value_778: Int = 1
    var value_779: Int = 1
    var value_780: Int = 1
    var value_781: Int = 1
    var value_782: Int = 1
    var value_783: Int = 1
    var value_784: Int = 1
    var value_785: Int = 1
    var value_786: Int = 1
    var value_787: Int = 1
    var value_788: Int = 1
    var value_789: Int = 1
    var value_790: Int = 1
    var value_791: Int = 1
    var value_792: Int = 1
    var value_793: Int = 1
    var value_794: Int = 1
    var value_795: Int = 1
    var value_796: Int = 1
    var value_797: Int = 1
    var value_798: Int = 1
    var value_799: Int = 1
    var value_800: Int = 1
    var value_801: Int = 1
    var value_802: Int = 1
    var value_803: Int = 1
    var value_804: Int = 1
    var value_805: Int = 1
    var value_806: Int = 1
    var value_807: Int = 1
    var value_808: Int = 1
    var value_809: Int = 1
    var value_810: Int = 1
    var value_811: Int = 1
    var value_812: Int = 1
    var value_813: Int = 1
    var value_814: Int = 1
    var value_815: Int = 1
    var value_816: Int = 1
    var value_817: Int = 1
    var value_818: Int = 1
    var value_819: Int = 1
    var value_820: Int = 1
    var value_821: Int = 1
    var value_822: Int = 1
    var value_823: Int = 1
    var value_824: Int = 1
    var value_825: Int = 1
    var value_826: Int = 1
    var value_827: Int = 1
    var value_828: Int = 1
    var value_829: Int = 1
    var value_830: Int = 1
    var value_831: Int = 1
    var value_832: Int = 1
    var value_833: Int = 1
    var value_834: Int = 1
    var value_835: Int = 1
    var value_836: Int = 1
    var value_837: Int = 1
    var value_838: Int = 1
    var value_839: Int = 1
    var value_840: Int = 1
    var value_841: Int = 1
    var value_842: Int = 1
    var value_843: Int = 1
    var value_844: Int = 1
    var value_845: Int = 1
    var value_846: Int = 1
    var value_847: Int = 1
    var value_848: Int = 1
    var value_849: Int = 1
    var value_850: Int = 1
    var value_851: Int = 1
    var value_852: Int = 1
    var value_853: Int = 1
    var value_854: Int = 1
    var value_855: Int = 1
    var value_856: Int = 1
    var value_857: Int = 1
    var value_858: Int = 1
    var value_859: Int = 1
    var value_860: Int = 1
    var value_861: Int = 1
    var value_862: Int = 1
    var value_863: Int = 1
    var value_864: Int = 1
    var value_865: Int = 1
    var value_866: Int = 1
    var value_867: Int = 1
    var value_868: Int = 1
    var value_869: Int = 1
    var value_870: Int = 1
    var value_871: Int = 1
    var value_872: Int = 1
    var value_873: Int = 1
    var value_874: Int = 1
    var value_875: Int = 1
    var value_876: Int = 1
    var value_877: Int = 1
    var value_878: Int = 1
    var value_879: Int = 1
    var value_880: Int = 1
    var value_881: Int = 1
    var value_882: Int = 1
    var value_883: Int = 1
    var value_884: Int = 1
    var value_885: Int = 1
    var value_886: Int = 1
    var value_887: Int = 1
    var value_888: Int = 1
    var value_889: Int = 1
    var value_890: Int = 1
    var value_891: Int = 1
    var value_892: Int = 1
    var value_893: Int = 1
    var value_894: Int = 1
    var value_895: Int = 1
    var value_896: Int = 1
    var value_897: Int = 1
    var value_898: Int = 1
    var value_899: Int = 1
    var value_900: Int = 1
    var value_901: Int = 1
    var value_902: Int = 1
    var value_903: Int = 1
    var value_904: Int = 1
    var value_905: Int = 1
    var value_906: Int = 1
    var value_907: Int = 1
    var value_908: Int = 1
    var value_909: Int = 1
    var value_910: Int = 1
    var value_911: Int = 1
    var value_912: Int = 1
    var value_913: Int = 1
    var value_914: Int = 1
    var value_915: Int = 1
    var value_916: Int = 1
    var value_917: Int = 1
    var value_918: Int = 1
    var value_919: Int = 1
    var value_920: Int = 1
    var value_921: Int = 1
    var value_922: Int = 1
    var value_923: Int = 1
    var value_924: Int = 1
    var value_925: Int = 1
    var value_926: Int = 1
    var value_927: Int = 1
    var value_928: Int = 1
    var value_929: Int = 1
    var value_930: Int = 1
    var value_931: Int = 1
    var value_932: Int = 1
    var value_933: Int = 1
    var value_934: Int = 1
    var value_935: Int = 1
    var value_936: Int = 1
    var value_937: Int = 1
    var value_938: Int = 1
    var value_939: Int = 1
    var value_940: Int = 1
    var value_941: Int = 1
    var value_942: Int = 1
    var value_943: Int = 1
    var value_944: Int = 1
    var value_945: Int = 1
    var value_946: Int = 1
    var value_947: Int = 1
    var value_948: Int = 1
    var value_949: Int = 1
    var value_950: Int = 1
    var value_951: Int = 1
    var value_952: Int = 1
    var value_953: Int = 1
    var value_954: Int = 1
    var value_955: Int = 1
    var value_956: Int = 1
    var value_957: Int = 1
    var value_958: Int = 1
    var value_959: Int = 1
    var value_960: Int = 1
    var value_961: Int = 1
    var value_962: Int = 1
    var value_963: Int = 1
    var value_964: Int = 1
    var value_965: Int = 1
    var value_966: Int = 1
    var value_967: Int = 1
    var value_968: Int = 1
    var value_969: Int = 1
    var value_970: Int = 1
    var value_971: Int = 1
    var value_972: Int = 1
    var value_973: Int = 1
    var value_974: Int = 1
    var value_975: Int = 1
    var value_976: Int = 1
    var value_977: Int = 1
    var value_978: Int = 1
    var value_979: Int = 1
    var value_980: Int = 1
    var value_981: Int = 1
    var value_982: Int = 1
    var value_983: Int = 1
    var value_984: Int = 1
    var value_985: Int = 1
    var value_986: Int = 1
    var value_987: Int = 1
    var value_988: Int = 1
    var value_989: Int = 1
    var value_990: Int = 1
    var value_991: Int = 1
    var value_992: Int = 1
    var value_993: Int = 1
    var value_994: Int = 1
    var value_995: Int = 1
    var value_996: Int = 1
    var value_997: Int = 1
    var value_998: Int = 1
    var value_999: Int = 1
  }
       
}
