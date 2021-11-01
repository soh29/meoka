package qa.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

import qa.domain.QAVO;

public interface QAMapper {
	List<QAVO> selectQAList() throws Exception;
}
