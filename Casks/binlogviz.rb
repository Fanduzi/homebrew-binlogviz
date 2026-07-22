cask "binlogviz" do
  version "0.21.0"

  on_macos do
    on_intel do
      sha256 "6267b6a09dff03ca6eda93deec4cc78746d7e5d4f0b5968e59e3a55fa437af35"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.0/binlogviz_0.21.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "fc26de04928f8c90d0055fdf9fc14fe4a4b93be91b11e5cbf77c7735cf7534c6"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.0/binlogviz_0.21.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e9e88bad096b4a186c14d7350a2d30b3ab264605887a95cafac5d278445e63ff"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.0/binlogviz_0.21.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "9ac2a35d9e37e47a19ac9de2431cf3a2ce1e567858a9a29dd5f5af5a21bff624"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.21.0/binlogviz_0.21.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
